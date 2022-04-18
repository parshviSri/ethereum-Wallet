// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 * @custom:dev-run-script ./scripts/deploy_with_ethers.ts
 */
    contract EthWallet{
        event SubmitTransaction(address _to, address _from, uint amount);
        address payable public  owner;
        constructor(){
            owner = payable(msg.sender);

        }

        receive() external payable {}
        function withdraw (uint _amount) external{
            require(owner == msg.sender,"You are not the owner");
            owner.transfer(_amount);
        }

        function getRemainingBalance() external view returns (uint){
            return address(this).balance;
        }
        function getOwnerBalance() external view returns (uint) {
            return owner.balance;
        }
    }
