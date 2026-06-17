# Enigma-Agro-Forestry-Tree-Tracker

> 🧩 **STUDENT TEMPLATE.** Every `TODO(memberN)` in `contracts/` and `frontend/src/modules/` is yours to implement. The tests in `test/` are the spec — run `forge test` until green. The Auto-Grade Action scores each push. See [STUDENT_GUIDE](../../STUDENT_GUIDE.md).

> Team Enigma (Group E) · CS-GY 9215 Applied Blockchain · **Scenario:** Agro-forestry provenance: tree-planting batches are certified and anchored on-chain, ownership moves along the carbon-credit supply chain, and fraud is revocable.
> One of six fully-functional reference solutions sharing the four-slice attestation architecture (domain-specific functions per scenario) — see [`../../PROJECT_BRIEF.md`](../../PROJECT_BRIEF.md).
> **Status:** Replicated from the gold reference (Vehicle-Emission). All four slices on the dual-network standard (Anvil + Sepolia).


<!-- TRYIT_START -->
## ▶ Try it

- 🌐 **Live GUI (GitHub Pages):** <https://enigma-group-project.github.io/Enigma-Agro-Forestry-Tree-Tracker/>
- 💻 **Run locally:** `cd frontend/src && python3 -m http.server 8080` → open <http://localhost:8080>
- 📖 **Procedures:** [docs/PROCEDURES.md](docs/PROCEDURES.md)
- 📊 **Tracker:** <https://enigma-group-project.github.io/Enigma-Agro-Forestry-Tree-Tracker/tracker/>

## 🛠 Build · deploy · run · test (per slice)

```bash
forge build                                   # compile all four slices
forge install foundry-rs/forge-std            # one-time (tests need it)
forge test -vvvv                              # run every slice test
anvil &                                        # terminal 2: local chain
forge script script/Deploy.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
# then: cd frontend/src && python3 -m http.server 8080  →  open the module pages below
```

| # | Slice | Contract | Test this slice | Frontend page | Key functions |
|---|-------|----------|-----------------|---------------|---------------|
| 1 | Nursery Registration | `contracts/IssuerRegistry.sol` | `forge test --match-contract IssuerRegistryTest` | `frontend/src/modules/issuer/` | `registerNursery · deregisterNursery · transferSteward` |
| 2 | Planting Registration | `contracts/RecordRegistry.sol` | `forge test --match-contract RecordRegistryTest` | `frontend/src/modules/record/` | `registerPlanting` |
| 3 | Verification | `contracts/Verification.sol` | `forge test --match-contract VerificationTest` | `frontend/src/modules/verification/` | `verifyPlanting · verifyPlantingHash` |
| 4 | Transfer / Revoke / Audit | `contracts/AuditTrail.sol` | `forge test --match-contract AuditTrailTest` | `frontend/src/modules/audit/` | `transferParcel · revokePlanting · updateGrowth · logCarbonCheckpoint` |

> Compile = `forge build` · deploy = the `forge script` above (Anvil) or RUNBOOK §2b (Sepolia) · run = the GUI URLs above · test = the per-slice `forge test --match-contract` commands.
<!-- TRYIT_END -->

## Roles
| Role | Who | Permissions |
|------|-----|-------------|
| Issuer | Certifier/Nursery | create / update / revoke TreeBatch |
| Owner | Farmer/Steward | transfer their own TreeBatch |
| Verifier | Carbon Buyer/Auditor | read-only verification |
| Admin | deployer | manage issuer roles, link controller |

## Quickstart (local Anvil)
```bash
forge build
forge install foundry-rs/forge-std
forge test -vvvv
forge test --gas-report

anvil &
forge script script/Deploy.s.sol --rpc-url http://127.0.0.1:8545 --broadcast
# paste addresses into frontend/src/shared/config.js (anvil block), ABIs into shared/abi.js
# open frontend/src/index.html and pick "Local Anvil"
```

## Hosted demo on GitHub Pages (Sepolia)
```bash
forge script script/Deploy.s.sol --rpc-url $SEPOLIA_RPC_URL --broadcast --verify
```
1. Paste Sepolia addresses into `frontend/src/shared/config.js` and set `DEFAULT_NETWORK = "sepolia"`.
2. Settings → Pages → Source = GitHub Actions (the included `pages.yml` publishes `frontend/src`).
3. Reads go over a public Sepolia RPC (no wallet); writes use the visitor's MetaMask.

## Contribution statement
| Member | Slice owned | Branch | Evidence |
|--------|-------------|--------|----------|
| member1 | Certifier Registration (`IssuerRegistry`) | `feature/member1-issuer-registration` | _screenshot / test output_ |
| member2 | Record Creation (`RecordRegistry`) | `feature/member2-record-creation` | _…_ |
| member3 | Verification (`Verification`) | `feature/member3-verification` | _…_ |
| member4 | Transfer/Revoke/Audit (`AuditTrail`) | `feature/member4-transfer-audit` | _…_ |

> Member labels are generic — map them to real students (and GitHub handles in `.github/CODEOWNERS`) when you assign slices.

## Branching
Branch off `develop`; PR into `develop` (never `main`). Each PR = 1 contract + 1 frontend + 1 test + 1 doc change. See PROJECT_BRIEF §8.
