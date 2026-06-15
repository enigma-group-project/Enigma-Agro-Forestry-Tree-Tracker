# Slice 2 — Record Creation (`RecordRegistry.sol`)

> Owner: member2 · Branch: `feature/record-module` · Scenario: Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.

## What it does
Issues a TreeBatch and stores the on-chain proof (hash + CID + owner + status). The only
contract that mutates state; mutations after creation go through the controller (Slice 4).

## Functions
- `registerPlanting(id, dataHash, cid, owner, metadataURI)` — `onlyNursery`, `nonReentrant`.
- `getRecord(id)` / `exists(id)` — views from `IAttestationRegistry`.
- `setController(address)` — steward links the AuditTrail once.

## Data representation
See `schemas/record.schema.json` (off-chain) and `schemas/attestation-onchain.schema.json` (on-chain).

## Tests (`test/RecordRegistry.t.sol`)
- issuer can create · non-issuer reverts · duplicate reverts.

## TODO checklist
- [ ] `TODO(slice-2)` event-emission test
- [ ] frontend: validate record.json against the schema before issuing
