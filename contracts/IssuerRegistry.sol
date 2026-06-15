// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

/// @title IssuerRegistry — Slice 1 (Nursery Registration)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member1). Behavior is described in docs/issuer-module.md and
///         locked by test/IssuerRegistry.t.sol — run `forge test` until it is green.
contract IssuerRegistry {
    address public steward;
    mapping(address => bool) public isNursery;

    event StewardTransferred(address indexed from, address indexed to);
    event NurseryRegistered(address indexed issuer, address indexed by);
    event NurseryDeregistered(address indexed issuer, address indexed by);

    error NotSteward();
    error ZeroAddress();

    modifier onlySteward() {
        if (msg.sender != steward) revert NotSteward();
        _;
    }

    constructor() {
        steward = msg.sender;
        emit StewardTransferred(address(0), msg.sender);
    }

    /// @notice Grant the issuer role. Admin-only; reject zero address; emit NurseryRegistered.
    function registerNursery(address account) external onlySteward {
        // TODO(member1): if account == address(0) revert ZeroAddress();
        //               isNursery[account] = true; emit NurseryRegistered(account, msg.sender);
        revert("TODO(member1): implement registerNursery");
    }

    /// @notice Revoke the issuer role. Admin-only; emit NurseryDeregistered.
    function deregisterNursery(address account) external onlySteward {
        // TODO(member1): isNursery[account] = false; emit NurseryDeregistered(account, msg.sender);
        revert("TODO(member1): implement deregisterNursery");
    }

    /// @notice Transfer the steward key. Admin-only; reject zero address; emit StewardTransferred.
    function transferSteward(address newAdmin) external onlySteward {
        // TODO(member1): validate newAdmin, emit StewardTransferred(steward, newAdmin), then steward = newAdmin;
        revert("TODO(member1): implement transferSteward");
    }
}
