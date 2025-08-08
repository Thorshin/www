from gtts import gTTS
import os
import platform
import time

# Texte à lire (tu peux modifier)

texte = """
Bienvenue dans cette démonstration de l’application mobile HSE, conçue pour faciliter la remontée rapide et structurée des anomalies en milieu industriel.

Dès l’ouverture, l'application affiche automatiquement le formulaire de saisie des anomalies.

Pour documenter l’anomalie, nous avons deux options :
- Soit appuyer sur « Prendre une photo » pour capturer une image directement avec l’appareil photo du téléphone ;
- Soit choisir une image déjà existante en appuyant sur « Choisir depuis la galerie ».

Ensuite, nous remplissons les champs obligatoires : la description de l’anomalie, la nature de l'incident — ici, par exemple, une fuite d’huile — et le service concerné.

Si l’anomalie est critique, nous pouvons activer l’option « Ligne Rouge » en cochant la case prévue à cet effet.

Une fois tous les champs renseignés, il suffit d’appuyer sur le bouton jaune « Enregistrer » pour soumettre le formulaire.

En appuyant sur le bouton « Enregistrement », nous accédons à la page d’historique.

Un tableau complet s’affiche, listant les anomalies précédemment saisies, accompagnées de leurs photos, dates, entités, descriptions et statuts.

Les anomalies critiques, marquées Ligne Rouge, sont surlignées pour être facilement identifiables.

Nous disposons également d’un système de filtres puissants : il est possible de rechercher par période, par service concerné, par entité, ou par mot-clé.

Il est même possible d’appliquer un filtre spécifique sur les anomalies « Ligne Rouge ». Cela permet une analyse ciblée et rapide.

Les données peuvent ensuite être exportées au format PDF ou Excel, pour traitement ou archivage.

Pour consulter davantage de colonnes dans le tableau d’historique, il suffit de faire pivoter l’écran du téléphone en mode paysage.

L’interface s’adapte automatiquement pour afficher plus d’informations sans perte de lisibilité.

À tout moment, il est possible d’utiliser le bouton « Retour » du téléphone pour revenir à l’écran précédent, notamment du tableau vers le formulaire.

La navigation est simple, intuitive et optimisée pour les interventions rapides sur le terrain.

L’application HSE permet de capturer, documenter et suivre les anomalies en quelques instants. Grâce à l’intégration de la caméra, de la galerie, du suivi par filtres, et de l’historique exportable, elle devient un outil central pour améliorer la sécurité et la réactivité sur site.
"""

# Création de la voix (français)
tts = gTTS(text=texte, lang='fr', slow=False, tld='com')  # `tld='com'` donne une voix masculine

# Sauvegarde du fichier audio
tts.save("narration_HSE_gtts.mp3")

print("✅ Fichier audio généré : narration_HSE_gtts.mp3")

# Lecture automatique
if platform.system() == "Windows":
    os.startfile("narration_HSE_gtts.mp3")
elif platform.system() == "Darwin":  # macOS
    os.system("afplay narration_HSE_gtts.mp3")
else:  # Linux
    os.system("mpg123 narration_HSE_gtts.mp3")