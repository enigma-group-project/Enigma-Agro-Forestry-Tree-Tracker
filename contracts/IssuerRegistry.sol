// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
/// @title IssuerRegistry — Slice 1 (Nursery Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). OZ Ownable: owner = Steward.
contract IssuerRegistry is Ownable {
    mapping(address => bool) public isNursery;
    event StewardTransferred(address indexed from, address indexed to);
    event NurseryRegistered(address indexed nursery, address indexed by);
    event NurseryDeregistered(address indexed nursery, address indexed by);
    error NotSteward();
    error ZeroAddress();
    modifier onlySteward() { if (msg.sender != owner()) revert NotSteward(); _; }
    constructor() Ownable(msg.sender) { emit StewardTransferred(address(0), msg.sender); }
    function steward() external view returns (address) { return owner(); }
    function registerNursery(address account) external onlySteward {
        // TODO(member1): if zero revert ZeroAddress; isNursery[account]=true; emit NurseryRegistered.
        revert("TODO(member1): implement registerNursery");
    }
    function deregisterNursery(address account) external onlySteward {
        // TODO(member1): isNursery[account]=false; emit NurseryDeregistered.
        revert("TODO(member1): implement deregisterNursery");
    }
    function transferSteward(address newAdmin) external onlySteward {
        // TODO(member1): validate; _transferOwnership(newAdmin); emit StewardTransferred.
        revert("TODO(member1): implement transferSteward");
    }
}
