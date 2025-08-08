import pyttsx3

engine = pyttsx3.init()

# Lister toutes les voix
voices = engine.getProperty('voices')
for i, voice in enumerate(voices):
    print(f"[{i}] {voice.name} – {voice.id}")

# Forcer une voix (Paul si dispo)
for voice in voices:
    if "Hortense" in voice.name:
        engine.setProperty('voice', voice.id)
        break


engine.say("Test de voix Paul. Est-ce que vous m'entendez ?")
engine.runAndWait()
