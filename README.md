# testTaskForITS_Partner IOS
<img src="https://camo.githubusercontent.com/467ed139385667771e9fe3da0e60ece0d4ec64128a76e8a515e57aecfddf765e/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f73776966742d352d627269676874677265656e2e7376673f7374796c653d666c6174" alt="Language" data-canonical-src="https://img.shields.io/badge/swift-5-brightgreen.svg?style=flat" style="max-width: 100%;">
<h2>Описание Тестового задания</h2>
<ul>
  <li>Получить данные по ссылке http://www.json-generator.com/api/json/get/clyWAUbaxu?indent=2</li>
  <li>Отобразить данные на экране в двух режимах (UITableView & UICollectionVIew) полей gender name age</li>
  <li>Добавить возможность фильтрации по возрасту (возрастание убывание).</li>
  <li>Добавить возможность отображения определенного пола пользователей.</li>
  <li>По нажатия по ячейке - отобразить все данные о выбранном человеке в отдельном окне.</li>
  <li>Добавить возможность перезагрузки данных</li>
  <li>* Добавить адреса на карту и в доп инфо pin'a отобразить имя пользователя</li>
  <li>Архитектура : MVVM / MVP / Clean architecture.</li>
  <li>Дизайн может быть тривиальный.</li>
</ul>
<p>После проверки тех. специалистом были справлены недочеты</p>
<h2>Скриншоты работы</h2>
<img src="https://i.ibb.co/R9vpmrr/demo-Project.png" style="max-width: 100%;">
<h2>Stack</h2>
<ul>
  <li>UIKit, MapKit</li>
  <li>UIScrollView, UITableView, UICollectionView</li>
  <li>MVC</li>
  <li>REST API</li>
  <li>JSON</li>
  <li>URLSession</li>
</ul>
<h2>Получен Feedback от тех.специалист</h2>
<p>Минусы</p>
<ul>
  <li>Отсутствие контроля приватности (private/public)</li>
  <li>Нереализованные константы (хотя и создан файл для них)</li>
  <li>Повторение кода, где этого можно было избежать (filterUsers / segmentedControlAgeAct)</li>
</ul>
<p>Плюсы</p>
<ul>
  <li>реализовано кеширование</li>
  <li>отличная реализация фильтрации и поиска с точки зрения UX</li>
  <li>дополнительный слой MVVM</li>
  <li>хорошая попытка с map zoom level</li>
  <li>аккуратная структура проекта, чистый код</li>
</ul>






