regex=[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?
 $i=~$regex ]

#clean Up
tail -n +2 customer_profiles.csv | awk -F '","' '!$3{next}1' #enlever field vide
tail -n +2 viewing_data.csv | awk -F '","' '!$3{next}1' #enlever field vide
tail -n +2 customer_profiles.csv | awk 'age <= 0' # eneleve ligne ou age est 0 un negatif
tail -n +2 customer_profiles.csv |awk -F, '$3+0 != 0 && $2 ~ /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/' #verif mail


## Agrégation des données (habitudes de visionnement)
#Rédigez un script pour calculer la durée totale de visionnement pour chaque client. 
#Affichez un fichier CSV avec `customer_id` (identifiant du client) et `total_viewing_duration` (durée totale de visionnement).

new csv file resulat.csv
awk -F, '{sum[$1]+=$2} END {for (id in sum) print id "," sum[id]}' viewing_data > resulat.csv
#ajouter cutomer id colonne 1
while read line
do
   echo "Record is : $line"
done < resultat.csv

#Rédigez un script pour déterminer la durée moyenne de visionnement pour chaque type d'abonnement. 
#Affichez un tableau montrant subscription_type (type d'abonnement) et average_viewing_duration (durée moyenne de visionnement).

new csv file resulat.csv
awk -F, '{sum[$1]+=$2} END {for (id in sum) print id "," sum[id]}' content_type > resulat.csv
#ajouter cutomer id colonne 1

for content_type in resultat.csv

    for i in $( awk '{ print $4; }' viewing_data.txt )
    if content_type == content_type 
    do 
        total=$(echo $total+$i | bc )
        ((count++))
    done
    echo "scale=2; $total / $count" | bc

while read line
do
   echo "Record is : $line"
done < resultat.csv