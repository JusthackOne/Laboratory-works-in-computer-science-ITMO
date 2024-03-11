1. Устанавливаем виртуальную машину А с данными настройками на данных скриншотах. 
<image src="screenshots/1.png">
<image src="screenshots/2.png">
<image src="screenshots/3.png">

2. Проверим доступ в интернет, введя в сайт **test.bash** следующий код:
<image src="screenshots/4.png">

3. В консоли видим следующий результат, значит доступ в интернет есть.
<image src="screenshots/5.png">

4. Аналогично настраиваем виртуальную машину Б, как в пункте *1*.

5. В приложении VirtualBox вводим сочитания клавич *Ctrl+H*, чтобы открыть менеджер сетей и создаём новую сеть NatNetwork.
<image src="screenshots/7.png">

6. В настройках машины А в разделе *сеть* выбираем тип подключения **Сеть NAT**. Аналогично делаем для машины Б.
<image src="screenshots/8.png">

7. Устанавливаем на обоих машинах утилиту, для просмотра устройств в локальной сети через команду `sudo apt install arp-scan`.

8. Сначала смотрим проверяем сетевой интерфейс с помощью команды `ip addr list`. Мой - *enp0s3*.
<image src="screenshots/10.png">

9. Далее смотрим устройства в локальной сети: `sudo arp-scan --interface=enp0s3 --localnet`.
<image src="screenshots/11.png">

10. Проверяем соединение через `ping`.
<image src="screenshots/12.png">

11. Аналогично 1 пункту поднимаем машину В. Повторяем все пункты для данной машины из 2-9.

12. Чтобы запретить доступ из Б в В, вводим команду `sudo iptables -t filter -A OUTPUT -d 10.0.2.5/32 -j REJECT`. Далее проверяем доступ по команде `ping 10.0.2.5`.
<image src="screenshots/13.png">

13. Доступ из машины А в машину В.
<image src="screenshots/14.png">

14. Доступ из машины А в Б.
<image src="screenshots/15.png">
