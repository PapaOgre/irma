# irma

Écran d'affichage de la météo locale suivant une configuration particulière

# Fonctionnalités prévues

  * [-2] Pouvoir configurer l'outil pour renseigner : 
    * la ville locale (par exemple Oberhausbergen)
    * une ville distante (par exemple Strasbourg)
    * des seuils de limite pour des déclencheurs particuliers (non prioritaire)
    * les couleurs choisies
  * Affichage de plusieurs informations : 
    * [-2] minimale de la journée
    * [+2] maximale de la journée
    * [-1] type de temps (couvert, ensoleillé, neige, brouillard, etc.)
    * [+2] s'il pleut ou pas (oui/non)
    * [0] les heures de pluie prévues (14h à 17h par exemple)
    * [+1] températures ressenties
    * [+1] vitesse du vent maximum pendant la journée
    * [+2] différence de température par rapport à hier (par exemple +5° de plus que hier)
    * [+1] code couleur (genre le fond d'écran par exemple, ou un carré bien visible ou même les contours d'une image avec l'intérieur coloré) du style : 
      * s'il pleut, du bleu
      * s'il fait chaud, du rouge
      * du coup, s'il pleut et chaud : violet
      * si pas de pluie : aucune couleur particulière
      * s'il fait froid : jaune
      * si froid et pluie : vert
