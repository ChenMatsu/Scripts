from transformers import pipeline

llm_pipeline = pipeline("text-generation", model="distilbert-base-uncased-distilled-squad")

def generate(prompt: str) -> str:
    return llm_pipeline(prompt, max_length=300, num_return_sequences=1)[0]["generated_text"]

if __name__ == "__main__":
    print("Input prompt(q to quit): ")


    while True:
        prompt = input()

        if prompt.lower() == "q":
            break

        print("Response: ", generate(prompt))
