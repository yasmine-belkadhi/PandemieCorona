# Suivi Pandémie Corona

Projet Data complet de suivi de la pandémie COVID-19 (2020-2023), couvrant l'ensemble du pipeline : de l'ingestion des données brutes jusqu'à la visualisation interactive.

---

## Architecture du projet

```
Fichier CSV → Talend (ETL) → PostgreSQL → Power BI Dashboard
```

---

## Technologies utilisées

| Outil | Rôle |
|---|---|
| **Talend** | Extraction, nettoyage et chargement des données |
| **PostgreSQL** | Stockage des données traitées |
| **Power BI** | Visualisation et tableau de bord interactif |

---

## Pipeline ETL (Talend) — 2 Jobs

### Job 1 — Alimentation des Dimensions
Lecture du fichier CSV et chargement des tables de dimensions :
- **dim_pays** : liste des pays
- **dim_temps** : table de dates/périodes

### Job 2 — Alimentation de la Table de Faits
- Lecture du même fichier CSV
- **Lookup** sur `dim_pays` → récupération de `id_pays`
- **Lookup** sur `dim_temps` → récupération de `id_temps`
- Chargement dans la **table de faits** avec les clés étrangères

---

## Data Warehouse (PostgreSQL) — Schéma en Étoile ⭐

```
        dim_temps
            |
dim_pays — table_fait
```

- **dim_pays** : `id_pays`, `nom_pays`, ...
- **dim_temps** : `id_temps`, `date`, `mois`, `trimestre`, `annee`
- **table_fait** : `id_pays (FK)`, `id_temps (FK)`, `nouveaux_cas`, `nouveaux_deces`, `total_cas`, `total_deces`

---

## Dashboard Power BI

### KPIs principaux
- Total cas cumulés : **676,47 millions**
- Total décès cumulés : **6,88 millions**
- Taux de mortalité : **1,02%**

### Visualisations
- Évolution des nouveaux cas et décès mondiaux (2020-2023)
- Nouveaux cas par trimestre et par année
- Top 5 pays les plus touchés
- Répartition mondiale des cas (carte interactive)
- Filtres dynamiques : Année, Pays

---

## Structure du projet

```
suivi-pandemie-corona/
│
├── 📂 talend/
│   └── CORONA.zip
│
├── 📂 database/
│   └── schema.sql
│
├── 📂 dashboard/
│   └── covid_dashboard.pbix
│
├── 📂 data/
│   └── sample_data.csv
│
└── 📄 README.md
```
