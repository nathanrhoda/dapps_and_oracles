// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract ExerciseC6A {

    /********************************************************************************************/
    /*                                       DATA VARIABLES                                     */
    /********************************************************************************************/


    struct UserProfile {
        bool isRegistered;
        bool isAdmin;
    }

    address private contractOwner;                  // Account used to deploy contract
    mapping(address => UserProfile) userProfiles;   // Mapping for storing user profiles    

    bool private operational = true;

    uint constant M = 3;
    address[] multiCalls = new address[](0);

    /********************************************************************************************/
    /*                                       EVENT DEFINITIONS                                  */
    /********************************************************************************************/

    // No events

    /**
    * @dev Constructor
    *      The deploying account becomes contractOwner
    */
    constructor
                                (                                    
                                ) 
                                public 
    {
        contractOwner = msg.sender;        
    }

    /********************************************************************************************/
    /*                                       FUNCTION MODIFIERS                                 */
    /********************************************************************************************/

    // Modifiers help avoid duplication of code. They are typically used to validate something
    // before a function is allowed to be executed.

    /**
    * @dev Modifier that requires the "ContractOwner" account to be the function caller
    */
    modifier requireContractOwner()
    {
        require(msg.sender == contractOwner, "Caller is not contract owner");
        _;
    }

    modifier requireIsOperational()
    {
        require(operational, "Contract is currently not operational");
        _;
    }

    modifier requireAdmin()
    {
        require(userProfiles[msg.sender].isAdmin, "Caller is not an admin");
        _;
    }
    
    modifier requireAdminSignOnlyOnce()
    {
        bool isDuplicate = false;
        for(uint c=0; c<multiCalls.length; c++) {
            if(multiCalls[c] == msg.sender) {
                isDuplicate = true;
                break;
            }            
        }

        require(isDuplicate == false, "Admin has already called this function.");    
        _;

    }
    /********************************************************************************************/
    /*                                       UTILITY FUNCTIONS                                  */
    /********************************************************************************************/

   /**
    * @dev Check if a user is registered
    *
    * @return A bool that indicates if the user is registered
    */   
    function isUserRegistered
                            (
                                address account
                            )
                            external
                            view
                            returns(bool)
    {
        require(account != address(0), "'account' must be a valid address.");
        return userProfiles[account].isRegistered;
    }


    function IsContractPaused
                            ()
                             public view
                            returns (bool)
    {
        return operational;
    }
    /********************************************************************************************/
    /*                                     SMART CONTRACT FUNCTIONS                             */
    /********************************************************************************************/

    function registerUser
                                (
                                    address account,
                                    bool isAdmin
                                )
                                external
                                requireIsOperational
                                requireContractOwner                                
    {
        require(!userProfiles[account].isRegistered, "User is already registered.");

        userProfiles[account] = UserProfile({
                                                isRegistered: true,
                                                isAdmin: isAdmin
                                            });
    }

    function setOperationStatus 
                                (
                                    bool state
                                )
                            external                            
                            requireAdmin 
                            requireAdminSignOnlyOnce
    {                        
        // bool isDuplicate = false;
        // for(uint c=0; c<multiCalls.length; c++) {
        //     if(multiCalls[c] == msg.sender) {
        //         isDuplicate = true;
        //         break;
        //     }            
        // }

        // require(isDuplicate == false, "Caller has already called this function.");    

        multiCalls.push(msg.sender);
        if(multiCalls.length >= M) {
            operational = state;
            multiCalls = new address[](0);
        }

        operational = state;        
    }
}

