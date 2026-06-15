# Architecture — Enigma-Agro-Forestry-Tree-Tracker

> Scenario: Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.

## Roles
- **Issuer** — Certifier/Nursery (holds the issuer role; creates/updates/revokes TreeBatch records)
- **Owner** — Farmer/Steward (controls transfer of their own record)
- **Verifier** — Carbon Buyer/Auditor (read-only authenticity check)
- **Admin** — deploys, manages issuer roles, links the controller

## System diagram
```
            ┌──────────────────┐
steward ─────▶│  IssuerRegistry  │◀──── isNursery()/steward() reads
            └──────────────────┘
                     ▲ role check
  issuer ──create──▶ │
            ┌──────────────────┐  controller-only   ┌──────────────┐
            │  RecordRegistry  │◀──────────────────│  AuditTrail  │◀── owner/issuer
            └──────────────────┘  transfer/revoke   └──────────────┘
                     ▲ view
            ┌──────────────────┐
verifier ─▶│   Verification   │
            └──────────────────┘
```

## Workflow (per action)
1. **Register issuer** — steward → `IssuerRegistry.registerNursery(Certifier/Nursery)`
2. **Create TreeBatch** — issuer → `RecordRegistry.registerPlanting(id, hash, cid, owner, metaURI)` → emits `PlantingRegistered`
3. **Verify** — verifier → `Verification.verifyPlanting(id, candidateHash)` → `(valid, status, owner, issuer)`
4. **Transfer** — owner → `AuditTrail.transferParcel(id, newOwner)` → emits `ParcelTransferred`
5. **Revoke / update** — issuer/steward → `AuditTrail.revoke|updateGrowth(...)`

## On-chain vs off-chain
| On-chain (lean, permanent) | Off-chain (large, private) |
|----------------------------|----------------------------|
| `keccak256(artifact)` hash | the TreeBatch file itself (IPFS) |
| IPFS CID + metadataURI     | the human-readable record.json |
| issuer/owner addresses     | any PII (never on-chain) |
| `issuedAt`, `status`, events | |

## Why blockchain here (and where a DB is fine)
- **Blockchain wins:** tamper-evidence, no single trusted server, public verifiability, issuer can revoke.
- **DB still better for:** search/discovery by name, private lookups, high-frequency mutable data.
> Fill this in with your scenario's concrete argument — it's worth 10 pts (Problem definition).
