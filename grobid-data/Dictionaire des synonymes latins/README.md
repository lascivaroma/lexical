Dictionnaire des synonymes latins
=================================

Données jusqu'au 3e niveau de Grobid. Attention, données OCR de moyenne qualité...

Utilisation du schéma :

- `<entry>`: Entrée de dictionnaire
- `<lemma>`: En-tête d'entrée. Peut comprendre plusieurs mots dans le cadre de liste de synonymes, ou des expressions.
- `<variant>`: Utilisé pour les renvois nombreux du document (Lemma, v[oire]. Entrée).
- `<sense>`: Utilisé sous `<entry>` quand une seule définition est donnée.
- `<subEntry>`: Utilisé sous `<entry>` quand plusieurs sens sont donnés et numérotés.

## Résultats

```
===== Field-level results =====

label                accuracy     precision    recall       f1           support

<lemma>              97.85        95.24        95.24        95.24        21     
<pc>                 96.77        96.88        93.94        95.38        33     
<sense>              96.77        80           66.67        72.73        6      
<subEntry>           94.62        82.35        87.5         84.85        16     
<variant>            100          100          100          100          11     

all (micro avg.)     97.2         93.02        91.95        92.49        87     
all (macro avg.)     97.2         90.89        88.67        89.64        87     
```
