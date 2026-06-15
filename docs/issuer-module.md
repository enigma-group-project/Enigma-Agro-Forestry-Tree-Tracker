# Slice 1 — Issuer Registration (`IssuerRegistry.sol`)

> Owner: member1 · Branch: `feature/issuer-module` · Scenario: Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.

## What it does
The single source of truth for **who may issue a TreeBatch** and who the steward is.

## Functions
- `registerNursery(address)` — steward grants the issuer role to a Certifier/Nursery.
- `deregisterNursery(address)` — steward revokes it.
- `transferSteward(address)` — hand the steward key to a multisig.
- `isNursery(address)` / `steward()` — reads used by the other three slices.

## Tests (`test/IssuerRegistry.t.sol`)
- steward is the deployer · register+revoke · non-steward reverts · zero-address reverts.

## TODO checklist
- [ ] `TODO(slice-1)` two-step steward handover
- [ ] event-driven issuer list in the frontend
- [ ] Extension: swap to OpenZeppelin `AccessControl`, note gas delta

## Demo evidence
Screenshot: registering a Certifier/Nursery and the `NurseryRegistered` event in the trace.
