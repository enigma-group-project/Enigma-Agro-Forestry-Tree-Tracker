# Slice 4 — Transfer / Revocation / Audit (`AuditTrail.sol`)

> Owner: member4 · Branch: `feature/audit-module` · Scenario: Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.

## What it does
The RecordRegistry **controller**: enforces who may transfer/revoke/update, then emits the
audit events that power the history page.

## Functions
- `transferParcel(id, newOwner)` — current Farmer/Steward only.
- `revokePlanting(id, reason)` / `updateGrowth(id, hash, cid)` — issuer/steward only.
- `logCarbonCheckpoint(id, note)` — anyone (demo history).

## Threat model (Security track — 5 pts)
| Threat | Mitigation in this design |
|--------|---------------------------|
| Fake issuer | role gated by `IssuerRegistry` |
| Unauthorized transfer | `msg.sender == owner` check |
| Reentrancy on state change | `nonReentrant` in RecordRegistry |
| Replay (duplicate id) | `AlreadyExists` check |
| Front-running revoke | _TODO(slice-4): analyze — issuer-only, gas price doesn't change correctness_ |

## Tests (`test/AuditTrail.t.sol`)
- owner transfers · non-owner reverts · issuer revokes · steward revokes.

## TODO checklist
- [ ] `TODO(slice-4)` event-driven history in the frontend
- [ ] finish the front-running / replay write-up
