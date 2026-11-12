# TP1 E-commerce - Version Java

Port Java (Spring Boot) du projet e-commerce Django, déployable sur **Azure App Service** (runtime Java).

## Prérequis
- Java 21+ JDK (pas seulement un JRE — `javac` doit être disponible)
- Maven 3.9+ (ou utiliser le wrapper Maven inclus)

> Sur certains systèmes, `JAVA_HOME` peut pointer vers un JRE sans compilateur. Dans ce cas, pointez `JAVA_HOME` vers un JDK avant d'utiliser `./mvnw` :
> ```bash
> export JAVA_HOME=/usr/lib/jvm/java-21-openjdk  # adaptez selon votre installation
> ```

## Lancer en local

```bash
./mvnw spring-boot:run
```

Puis ouvrir : http://localhost:8080/products

## Builder (jar)

```bash
./mvnw package -DskipTests
```
Le jar se trouve dans `target/tp1-ecommerce-java-1.0.0.jar`.

## Déploiement sur Azure App Service (runtime Java)

1. Créer une ressource Azure et un App Service plan (Linux, Java 21).
2. Définir les variables d'environnement :
   - `AZURE_RESOURCEGROUP`
   - `AZURE_APPNAME`
   - `AZURE_PRICINGTIER` (ex: B1)
   - `AZURE_REGION` (ex: France Central)
3. Builder et déployer :

```bash
./mvnw package azure-webapp:deploy
```

## Note runtime .NET
Ce dossier est une version **Java**. Azure App Service supporte nativement le runtime **.NET** (ASP.NET Core) via une pile séparée. Pour utiliser .NET sur Azure, créez une Web App ASP.NET Core distincte dans le portail Azure et sélectionnez le stack ".NET" au moment de la création.

## Structure
- `src/main/java/com/ecommerce` — contrôleurs, modèles, repositories
- `src/main/resources/templates` — vues Thymeleaf
- `pom.xml` — dépendances + plugin azure-webapp-maven-plugin
