import './Voting.sol';
import '@openzeppelin/contracts/proxy/clones.sol';
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;



contract VotingFactory {
    address public owner;
    Voting[] public deployedVoting;
    address public imutable implementation;

    constructor(){
        implementation = address(new Voting(owner))
    }
        
        event  votingDeployed(address _votingAddress);

        function deployVoting(address _owner)public{
            address payable clone = payable(clones.clone(implementation));
            Voting voting = Voting(clone);
            Voting.initialize(_owner);
            deployedVoting.push(voting);
            emit votingDeployed(address(voting));
        }
}