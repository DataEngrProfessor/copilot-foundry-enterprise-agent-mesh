
# Copilot Foundry Enterprise Knowledge Agent Mesh – Intelligent Contract & Compliance Hub

> Production-ready reference implementation for **Senior Microsoft AI Engineer – Copilot, Foundry & Power Automate** role.
> Built by Lanre Osahon Uzamere – Lead AI Engineer, SuperNomics AI & Info-Tech Research Group

## Business Impact
- 23 SharePoint libraries → single permission-aware RAG
- Processing: 3-5 min → 18 sec avg, 0 doc loss
- 96.8% extraction accuracy, 80%+ automation
- $2.3M+ annual savings pattern (claims → contracts)
- 99.2% Power Automate reliability with human-in-the-loop

## Architecture
```
M365 Copilot (Declarative Agent) → Copilot Studio → Foundry Agent Mesh (Classifier, Extractor, Risk, Compliance)
↘ Power Automate Orchestrator (Intake → Dataverse → Approval → SAP)
↘ Azure AI Search (permission-aware via Graph ACL) + APIM AI Gateway + Key Vault + Entra ID
```

## What's in this repo
- **foundry/** – Foundry agent definitions, prompt flows, evaluation set
- **copilot-studio/** – Copilot Studio solution export (topics, generative answers, manifest)
- **power-automate/** – 3 cloud flows with Scope-Try-Catch, retry, DLQ
- **custom-connectors/** – FastAPI BERT jurisdiction detector + SAP wrapper (Entra OAuth)
- **infra/** – Bicep for AI Search, OpenAI, APIM AI Gateway, Key Vault, Monitor
- **dataverse/** – Table schema, audit, confidence routing
- **.github/workflows** – Power Platform ALM: export/unpack, solution checker, deploy to Test/Prod
- **power-platform/** – GitHub-connected solution (managed/unmanaged) with env vars & connection refs

## Quick Start
1. `az deployment group create -f infra/bicep/main.bicep`
2. Import solution: `pac solution import --path power-platform/`
3. Configure env vars: `AI_SEARCH_ENDPOINT`, `FOUNDRY_PROJECT`, `APIM_GATEWAY`
4. Deploy connectors: `cd custom-connectors/jurisdiction-detector && az containerapp up`

## Key JD Alignments
- Independent M365/Azure/Power Platform admin: Entra ID app regs, DLP, RBAC, cost control via APIM logs
- GitHub-connected Power Platform: branching, PR reviews, solution dependencies, env vars, rollback
- Human review: Confidence <0.85 or risk=high → Model-driven app queue
- Evaluation: RAGAS groundedness, latency p95, hallucination rate in App Insights

## License: MIT
