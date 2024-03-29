## 1. Uruchomienie serwera
![image](https://github.com/BartoszKedziorek/L4_PAwChO/assets/104023013/a1d32d49-a4e8-4006-b234-89a2b6e75757)
## 2. Liczba warstw
![image](https://github.com/BartoszKedziorek/L4_PAwChO/assets/104023013/536d056d-a9a9-4c72-a36c-7fa9ed76fb56)
```
sudo docker history local/web100:v1
```
Wynik powyższego polecenia wskazuje, że obraz ma 3 warstwy. Zostały one utworzone przez polecenia:
```
FROM ubuntu
RUN apt update && apt upgrade -y \
  && apt install apache2 -y \
  && mkdir /var/www/gci/ \
  && service apache2 start
COPY index.html /var/www/html/index.html
```
Informację o ilości warstw możemy uzyskać także z pomocą polecenia:
```
sudo docker inspect <nazwa obrazu>
```
![image](https://github.com/BartoszKedziorek/L4_PAwChO/assets/104023013/a757be9f-6001-491f-82de-94613e1243f7)

### 3. Polecenia
```
sudo docker build -t local/lab4:v1 .
```
docker build - polecenie służące do budowania obrazów na podstawie dockerfile.
  Jako argument przyjmuje kontekst. Dzięki kontekstowi podczas tworzenia obrazu
  polecenie dockerfile będzie mogło korzystać z plików umieszczonych w katalogu
  kontekstu

- -t - flaga służąca do określania repozytorium, nazwy oraz taga tworzonego obrazu

```
sudo docker container run -d -p 8080:80 local/web100:v1
```
docker container run - polecenie służące uruchamianiu kontenerów. Jako argument
  przyjmuje obraz na postawie którego ma zostać stworzony kontener. Ewentualnie przyjmuje
  także polcenie, które ma wykonać przy uruchomieniu. W przypadku zadania polecenie
  to jest zdeterminowane bezpośrednio przez dockerfile poprzez instrukcję `ENTRYPOINT`
- -d - flaga informująca o tym, że kontener zostanie uruchominy w tle
- -p - flaga służąda do mapowania portów kontenera oraz hosta. W tym przypadku
       port 80 kontenera jest mapowany na port 8080 hosta

```
sudo docker history local/web100:v1
```
docker history - polecenie pokazujące etapy budowana obrazu. Jako argument
przyjmuje nazwę obrazu dla którego mają zostać wyświetlone etapy budowania.
```
sudo docker inspect local/web100:v1
```
docker inspect - polcenie wyświetlające informacje na temat wskazanego obrazu.
Domyślny format wyświetlanych informacji to JSON
