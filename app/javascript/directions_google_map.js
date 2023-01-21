let shops = gon.shops;
let rodging = gon.rodging;
console.log(rodging)
function initMap(){
  let initPos = {lat: rodging.latitude, lng: rodging.longitude};
  let mapOptions = {
    center: initPos,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  // #map要素にMapクラスの新しいインスタンスを作成
  myMap = new google.maps.Map(document.getElementById("map"), mapOptions);
  let bounds = new google.maps.LatLngBounds();
  for(let i = 0; i < shops.length; i++){
    createMarker({ //createMarker関数を呼び出している
      position: new google.maps.LatLng(shops[i].latitude, shops[i].longitude),
      text: `<a href="https://www.google.com/search?q=${shops[i].address}" tabindex="0">${shops[i].address}</a>`,
      map: myMap
    });
    bounds.extend(new google.maps.LatLng(shops[i].latitude, shops[i].longitude));
  }
  myMap.fitBounds(bounds);
}
initMap();

function createMarker(options) {
  // マップ情報を保持しているmyMapオブジェクトを指定
  options.map = myMap;
  // Markcrクラスのオブジェクトmarkerを作成
  let marker = new google.maps.Marker(options);
  // 各施設の吹き出し(情報ウインドウ)に表示させる処理
  let infoWnd = new google.maps.InfoWindow();
  infoWnd.setContent(options.text);
  // addListenerメソッドを使ってイベントリスナーを登録
  google.maps.event.addListener(marker, 'click', function(){
    infoWnd.open(myMap, marker);
  });
  return marker;
}

// 複数地点のルートを検索する
function search() {
  let initPos = {lat: rodging.latitude, lng: rodging.longitude};
  let mapOptions = {
    center: initPos,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };

  navigator.geolocation.watchPosition(success);
  function success(position) {
    let currentPos = new google.maps.LatLng(position.coords.latitude,position.coords.longitude)
      // #map要素にMapクラスの新しいインスタンスを作成
    myMap = new google.maps.Map(document.getElementById("map"), mapOptions);
    let directionsService = new google.maps.DirectionsService();
    let directionsDisplay = new google.maps.DirectionsRenderer;

    // 2地点以上のとき
    if (shops.length >= 1){
      let origin = currentPos; // 開始地点
      let destination = new google.maps.LatLng(rodging.latitude, rodging.longitude); // 終了地点
      let waypoints = []; // 経由地点
      // origin, destination, waypointsを設定する
      let bounds = new google.maps.LatLngBounds();
      for (let i = 0; i < shops.length; i++) {
        createMarker({ //createMarker関数を呼び出している
          position: new google.maps.LatLng(shops[i].latitude, shops[i].longitude),
          text: `<a href="https://www.google.com/search?q=${shops[i].address}" tabindex="0">${shops[i].address}</a>`,
          map: myMap
        });
        bounds.extend(new google.maps.LatLng(shops[i].latitude, shops[i].longitude));
        shops[i] = new google.maps.LatLng(shops[i].latitude, shops[i].longitude);
        waypoints.push({ location: shops[i], stopover: true });
      }
      myMap.fitBounds(bounds);
        // リクエスト作成
      let request = {
        origin:      origin,
        destination: destination,
        waypoints: waypoints,
        travelMode:  google.maps.TravelMode.WALKING
      };
      // ルートサービスのリクエスト
      directionsService.route(request, function(response, status) {
        if (status == google.maps.DirectionsStatus.OK) {
          // 結果を表示する
          directionsDisplay.setMap(myMap);
          directionsDisplay.setDirections(response);
        }
      });
    }
  }
}
search();
