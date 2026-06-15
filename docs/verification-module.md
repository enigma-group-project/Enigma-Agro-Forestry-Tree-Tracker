# Slice 3 — Verification (`Verification.sol`)

> Owner: member3 · Branch: `feature/verification-module` · Scenario: Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.

## What it does
The zero-gas read path a Carbon Buyer/Auditor uses to confirm a TreeBatch is authentic, active, and who owns it.

## Functions
- `verifyPlanting(id, candidateHash)` → `(valid, status, owner, issuer)`
- `verifyPlantingHash` · `statusOf` · `ownerOf`

## Demo script
1. Issue a TreeBatch (Slice 2).
2. Re-hash the same artifact in the Verification page → ✅ VALID.
3. Revoke it (Slice 4) → re-verify → status `Revoked`, valid=false.

## Tests (`test/Verification.t.sol`)
- hash match · wrong hash fails · verifyPlanting active.

## TODO checklist
- [ ] `TODO(slice-3)` assert valid=false after revoke
- [ ] in-browser IPFS fetch + re-hash
