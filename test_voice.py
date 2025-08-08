import pyttsx3

# Initialisation du moteur
engine = pyttsx3.init()

# Liste des voix disponibles
voices = engine.getProperty('voices')

# Recherche automatique d'une voix masculine
male_voice = None
for voice in voices:
    if "male" in voice.name.lower() or "david" in voice.name.lower():
        male_voice = voice
        break

# Si une voix masculine a été trouvée, on l'utilise
if male_voice:
    engine.setProperty('voice', male_voice.id)
    print(f"Voix masculine sélectionnée : {male_voice.name}")
else:
    print("⚠️ Aucune voix masculine trouvée, utilisation de la voix par défaut.")

# Volume et vitesse
engine.setProperty('volume', 1.0)  # volume maximum
engine.setProperty('rate', 150)    # vitesse normale

# Texte à lire
texte = "il etait une fois une reene gentille qui toujoiurs donne aux personnes pouvres de l'argent"

# Lecture
engine.say(texte)
engine.runAndWait()
