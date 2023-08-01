# TravelApp

## Screens
<table style"float:right;">

<tr>
  <td>  <img src ="https://github.com/engingulek/TravelApp/assets/74055938/aa0e179b-18a4-4dc0-8534-dffe7cc0c5c7"> </td>
</tr>
</table>

<br/>
<br/>


### Home Page
<p>
Ana Sayfa ilk ekran olarak karşımıza çıkmaktadır. Bu sayfada kalkış yerini,varış yerini, kalkış tarihini eğer gidiş dönüş olacaksa dönüş tarihini ve yolcu sayısı seçilebilinmetedir. 
Örnek olarak işlemin yapıldığı tarih 23 Haziran 2023 olarak alınsın. Gidiş tarihi 27 Haziran seçilip Dönüş tarihi yanlışlıkla yada bilerek 25 Haziran seçilir ise gidiş tarihi 25 Haziran olarak güncellenecekir.
</p>

### Bilet Seçimi
<p>
  Bilet seçim ekranında eğer sadece tek yön seçilmiş ise burada sadece tek yön için bilet seçimi yapılacaktır. Ancak çift yön seçilmiş ise gidiş bileti seçildilten sonra dönüş biletinin seçilmesi için başka bir bilet ekranı karşımıza çıkacaktır.


#### Uygun Biletlerin Getirilmesi
Biletlerin listelenmesiden ise seçilen şehirler ve tarihin yanında başka bir filterleme işlemi dahada gerçekleşmektedir. Bu işlem gidiş için olanı işlem yapılan saatten en erken yarım saat sonrası için bilet seçimi yapılabilmesidir. Dönüş bileri için ise en erken gidiş biletinin varış saatinden yarım saat sonrası için bilet seçimi yapılabilmektedir.

#### Tarih Seçimi ve Bilet Filtrelenmesi
Bilet seçim erkranında seçilen tarihden 30 gün sonrası içinde seçim yapılabilmesi için bir adet gün listesi bulunmaktadır. Ayrıca sınıf tipini ve günün herhangi bir vaktine göre seçim yapılabilmesi için bir filtreleme işlemi bulunmaktadır.
</p>

### Bilgi
<p>Bu sayfada seçilen bilet ve belirlene yolcu sayısına göre hem gidiş eğer dönüş bileti seçiminde yapılmıi ise dönüş biletinin fiyat listesinide alarak bize bir özet vermektedir. Bilgiler onaylandıktan sonra kredi kartı bilgileri ve kişisel bilgilerin girileceği ekrana geçilecektir.</p>

### Kredi Kartı ve Yolcu Bilgilerin Girilmesi.
<p>
  
  #### Telefon ve Email Girişi
  Bu alanda seçilen ülkenin telefon formatına göre girilen rakamlar o formatta yazılacaktır. Eğer boş bırakılır yada eksik girilir ise uyarı mesajı verilecektir.

  #### Yolcu Bilgilerinin Girilmesi 
  Burada yolcu bilgileri girilmesi gerekmektedir. Yine burda boş bırakılır ise uyarı mesajı verilecektir.Doğum tarigi gün ay ve yıl olarak yazıldıkça örnek olarak 20/06/2023 şeklinde formatlanacaktır. Doğum tarihi eğer 100 yaşını geçer ise uyarı mesajı verilecektir. Gelecekten bir tarih seçilir ise yine uyarı mesajı verilecektir. TC kimlik numarsı formatına uygun değil ise yani sonu çift rakam olması gibi yine hata verecektir

  #### Kart Bilgileri 
  Kart numarası ise görüldüğü 4'lü gruplar şelinde forlanacaktır. Son kullanım tarihide doğum tarihinde olduğu gibi kendine özel formatlama işlemi gerçekleşecektir. Her

Her şey doğru ise ödeme işlemi gerçekleşecektir.
</p>


## Databaase
Firebase Realtime Database kullanılmaktadır
<list>
<li>https://traveliosapp-default-rtdb.firebaseio.com/flights.json</li>
<li>https://traveliosapp-default-rtdb.firebaseio.com/flightTickets.json</li>
</list>

## Architectural Pattern
<li>MVVM</li>

## Test
<li>Unit Test</li>

