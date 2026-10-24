
from fastapi import FastAPI, Depends
from pydantic import BaseModel
import torch
from transformers import AutoModelForSequenceClassification, AutoTokenizer

app = FastAPI(title="Jurisdiction Detector - BERT multilingual")

class Req(BaseModel):
    text: str

# Load once (GPU if available via Triton)
tokenizer = AutoTokenizer.from_pretrained("bert-base-multilingual-cased")
model = AutoModelForSequenceClassification.from_pretrained("bert-base-multilingual-cased", num_labels=12)

@app.post("/detect")
def detect(req: Req):
    # Simplified - production loads fine-tuned checkpoint from Azure Blob
    inputs = tokenizer(req.text[:2000], return_tensors="pt", truncation=True)
    with torch.no_grad():
        logits = model(**inputs).logits
    jurisdiction_id = int(logits.argmax())
    jurisdictions = ["US-CA","US-NY","EU-GDPR","UK","NG","DE","FR","Other"]
    return {"jurisdiction": jurisdictions[jurisdiction_id % len(jurisdictions)], "confidence": float(logits.max())}

@app.get("/health")
def health():
    return {"status": "ok"}
