
# Evaluation & Admin Runbook

## Evaluation
- Golden set: 500 contracts manually annotated
- RAGAS: groundedness 0.92+, faithfulness 0.94, answer_relevancy 0.89
- Latency: p50 1.8s, p95 3.4s (via prompt cache + semantic ranker)
- Hallucination rate: 1.2% (App Insights custom metric `foundry.hallucination`)

## Failure Handling
- Graph throttling 429: Do-Until 3x exponential backoff (5s, 15s, 45s)
- File lock: check lock via Graph /driveItem, delay
- DLQ: Dataverse exception_queue + Teams webhook

## Admin Ownership
- Entra ID: 4 app registrations (Foundry, Graph, SAP, Search) with least privilege, cert rotation 90d via Key Vault
- DLP: Block HTTP without approval, block non-business connectors in prod
- Cost: APIM log analytics query per dept, alert if >$500/day

## How I Coordinated Outsourced Team
- Azure Boards, PR template requiring solution checker pass
- Daily 15m standup, weekly demo to legal stakeholders
