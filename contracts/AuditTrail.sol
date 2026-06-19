// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;
import {IAttestationRegistry} from "./interfaces/IAttestationRegistry.sol";
import {RecordRegistry} from "./RecordRegistry.sol";
import {ReentrancyGuard} from "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
/// @title AuditTrail — Slice 4 (Transfer / Revocation / Growth / Carbon)  [STUDENT TEMPLATE]
/// @notice Implement every TODO(member4). Spec: test/AuditTrail.t.sol.
contract AuditTrail is ReentrancyGuard {
    RecordRegistry public immutable registry;
    event ParcelTransferred(bytes32 indexed id, address indexed from, address indexed to, uint64 at);
    event PlantingRevoked(bytes32 indexed id, address indexed by, string reason, uint64 at);
    event GrowthUpdated(bytes32 indexed id, bytes32 newHash, string newCid, uint64 at);
    event CarbonCheckpointLogged(bytes32 indexed id, address indexed by, string note, uint64 at);
    error NotOwner();
    error NotNurseryOrSteward();
    error Missing();
    constructor(address recordRegistry) { registry = RecordRegistry(recordRegistry); }
    function transferParcel(bytes32 id, address newOwner) external nonReentrant {
        // TODO(member4): read record; require exists (Missing) + msg.sender==owner (NotOwner); controllerTransfer; emit ParcelTransferred.
        revert("TODO(member4): implement transferParcel");
    }
    function revokePlanting(bytes32 id, string calldata reason) external nonReentrant {
        // TODO(member4): require exists; issuer or steward (NotNurseryOrSteward); controllerRevoke; emit PlantingRevoked.
        revert("TODO(member4): implement revokePlanting");
    }
    function updateGrowth(bytes32 id, bytes32 newHash, string calldata newCid) external nonReentrant {
        // TODO(member4): same authz; controllerUpdate; emit GrowthUpdated.
        revert("TODO(member4): implement updateGrowth");
    }
    function logCarbonCheckpoint(bytes32 id, string calldata note) external {
        // TODO(member4): emit CarbonCheckpointLogged(id, msg.sender, note, uint64(block.timestamp));
        revert("TODO(member4): implement logCarbonCheckpoint");
    }
}
