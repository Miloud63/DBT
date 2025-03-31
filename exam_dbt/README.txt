Tout d’abord, si nous utilisons DBT et non directement Snowflake, c’est parce qu’avec DBT nous bénéficions de plusieurs avantages. Il permet notamment d’écrire du SQL dynamique grâce au langage Jinja, et de mettre en place une automatisation des tâches via un cron job.
Dans ce projet, nous utilisons la version gratuite DBT Core, que nous avons installée manuellement.

DBT permet également de se connecter à plusieurs systèmes comme Snowflake, Databricks, etc.

Dans notre cas, j’ai configuré la connexion avec Snowflake en renseignant les bons paramètres lors de l’exécution de la commande suivante dans le terminal :

dbt init <nom_du_projet>
Ensuite, j’ai voulu exposer les données d’une base déjà existante dans mon compte Snowflake, appelée EXAM, en sélectionnant uniquement certaines tables spécifiques : ALBUM, ARTIST, GENRE, MEDIATYPE, PLAYLIST, PLAYLISTTRACK, TRACK, et DIMMEDIATYPE.

Pour cela, j’ai ajouté la section suivante dans le fichier schema.yml :

sources:
  - name: EXAM
    description: 'Ceci est un test.'
    database: EXAM
    schema: PUBLIC
    tables:
      - name: ALBUM
      - name: ARTIST
      - name: GENRE
      - name: MEDIATYPE
      - name: PLAYLIST
      - name: PLAYLISTTRACK
      - name: TRACK
Nous avons ensuite procédé à la création du schéma en étoile (comme dans notre projet précédent sous Snowflake, avec dénormalisation), à l’aide des fichiers SQL suivants :

TrackFact.sql
dim_artist.sql
dim_mediatype.sql
dim_album.sql
dim_genre.sql
dim_playlist.sql
L’exécution de ces fichiers se fait avec la commande suivante :

dbt run -m tag:star_creation
Attention : cette commande utilise le profil par défaut défini dans profiles.yml. Il est donc important de s’assurer que ce profil pointe vers la bonne base de données.

Ensuite, pour garantir les contraintes (notamment sur les clés primaires), nous exécutons les tests via :

dbt test

NB: dbt test ne s'exécute pas automatiquement avec dbt run. Si vous utilisez dbt build, cela lancera à la fois les modèles et les tests.
Enfin, nous avons exécuté les différentes requêtes (comme query1.sql, query2.sql, etc.) en lançant :

dbt run -m tag:star_query
