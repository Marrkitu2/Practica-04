
# Gestió d'Articles

Este programa permite gestionar articles en una base de dades, incluïnt funcionalitats per inserir, modificar i esborrar articles. A continuació, es descriuen els diferents arxius que componen el projecte i la seva funcionalitat.

## Estrutura del Projecte

```
- index.php
- index.html
- articles.php
- model/
  - db.php
- vista/
  - Esborrar.html
  - Modificar.html
  - Inserir.html
- controladors/
  - esborrar.php
  - modificar.php
  - insertar.php
  - login.php
  - register.php
```

## Descripció dels Arxius

### 1. `index.php`
- **Funcionalitat**: Serveix com a pàgina principal de l'aplicació.
- **Gestió**: Comprova si l'usuari està connectat i mostra la llista d'articles des de la base de dades. Inclou missatges de successos o errors, i en funció de l'estat de connexió de l'usuari, mostra els enllaços per a inserir, modificar o esborrar articles.
- **Funcions Clau**: `mostrarArticulos()` - Carrega i mostra articles.

### 2. `index.html`
- **Funcionalitat**: Redirecciona automàticament a `index.php`.
- **Gestió**: Serveix com a punt d'entrada per al navegador, assegurant que els usuaris sempre accedeixen a la pàgina de gestió d'articles.

### 3. `model/db.php`
- **Funcionalitat**: Estableix la connexió amb la base de dades.
- **Gestió**: Conté les credencials de connexió a la base de dades i gestiona errors de connexió.

### 4. `vista/Esborrar.html`, `vista/Modificar.html`, `vista/Inserir.html`
- **Funcionalitat**: Formes HTML per a l'esborrat, modificació i inserció d'articles.
- **Gestió**: Cada formulari envia dades a l'script PHP corresponent en la carpeta `controladors`.

### 5. `controladors/esborrar.php`
- **Funcionalitat**: Gestor per esborrar articles de la base de dades.
- **Gestió**: Comprova que l'usuari estigui connectat i si l'ID de l'article existeix abans d'esborrar-lo.
- **Funcions Clau**: Utilitza consultes preparades per evitar injeccions SQL.

### 6. `controladors/modificar.php`
- **Funcionalitat**: Gestor per modificar articles existents.
- **Gestió**: Comprova que l'usuari estigui connectat i actualitza les dades de l'article en la base de dades.
- **Funcions Clau**: Utilitza consultes preparades per a una seguretat addicional.

### 7. `controladors/insertar.php`
- **Funcionalitat**: Gestor per inserir nous articles a la base de dades.
- **Gestió**: Recull dades del formulari i les inserta a la base de dades mitjançant consultes preparades.

### 8. `controladors/login.php`
- **Funcionalitat**: Gestor d'inici de sessió per als usuaris.
- **Gestió**: Comprova les credencials d'usuari i inicia la sessió si són vàlides.

## Funcions Importants

- **Seguretat**: Tots els scripts que manipulen la base de dades utilitzen consultes preparades per prevenir injeccions SQL.
- **Gestió de Sessions**: El sistema utilitza sessions per gestionar l'estat de connexió de l'usuari, mostrant missatges de successos o errors en funció de les accions realitzades.
- **Resiliència**: El sistema proporciona retroalimentació clara als usuaris sobre l'estat de les operacions, ja sigui un èxit o un error.

## Com Gestionar el Programa

1. **Iniciar Sessió**: L'usuari ha de iniciar sessió per poder modificar, esborrar o inserir articles.
2. **Gestionar Articles**: Un cop connectat, l'usuari pot accedir a les diferents funcionalitats a través de la pàgina principal.
3. **Redirecció Automàtica**: Accedint a `index.html`, l'usuari és redirigit a `index.php` per assegurar un accés correcte.

```
Hecho por Marcos Lopez Medina
```