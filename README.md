# Prolog

## Prerequisites

```
sudo dnf install pl
```

Or find a way to install SWI Prolog.

## Vivinasse

Génération de phrases aléatoires sur le thème du vin via l'implémentation d'une grammaire française en prolog.

Projet personnel en cours de développement.

Pour l'exécuter sur votre machine :

```
swipl -s vivinasse.prolog -g "gen." -t halt.
```

## SC

*WIP*

Generate sctrading.pl:

```
cd sc
python3 sctradingToProlog.py < sctrading.csv > facts.pl
```

Run an interpreter:

```
cd sc
swipl load.pl 
```

Run the server:

```prolog
server(8080).
```

Do some queries:

```
mostProfitableTrip(Departure, Arrival, Merchandise, CanBuy, 4, 5000, Profit, Safe).
```
