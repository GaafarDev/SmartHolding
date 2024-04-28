<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Jie Kai Part</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-rnN0A7S1jsT1hu9RHlMpaZJ7fdiN/kd8fXVn4+2oIyoJ4u0FQFnJkw/ZIzhSIAfy" crossorigin="anonymous">
  </script>
  <style>
    html{
      scroll-behavior: smooth;
    }
    
    .color-bar {
      height: 5vw; 
      background-color: #D9D9D9; 
      overflow: hidden;
      width:100vw; 
    }

    .viewFacility {
      color:#EF4A4A;
      margin-left: 3vw;
    }

    .container {
      display: flex;
      justify-content: center; 
      align-items: center; 
      flex-wrap:warp; 
    }

    .container img {
      height: 26vw;
      margin: 0.1vw; 
      box-shadow: 0px 5px 10px rgba(0, 0, 0, 0.2);
    }

    .color-bar b{
      padding-top:0.1vw; 
      margin-bottom: 0vw;
      font-size: 0.9vw;
    }

    .color-bar h2{
      color:black; 
      margin-top:0vw;
      font-size: 2.1vw;
    }
  </style>
</head>
<body>

    <jsp:include page="headerTenant.jsp" />

<br><br>
<sec>
  <div class="color-bar">
    <b class = "viewFacility">View Facilities.Bowling</b>
    <h2 class = "viewFacility">Gurney Bowl</h2>
  </div>

  <div class = "container">
    <div><img src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRR6SvwaxIL00x2CSSlaHlp83zzE_rwTq9T8RWMNJxubTHgWHnt"  style = "width:39.8vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSmawCwJxEgEZwpKCKHdqQIoQPuL4t19JMWNWAbGP8odCfBBe04" style = "width:20vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQTrXboIp_u-K5Plr-aQIuv0iQRc274GZwTxAiFlStOsuMs0Tdp" style = "width:39.8vw; object-fit: cover;"></div>
  </div>
</sec>

<br><br>
<sec>
  <div class="color-bar">
    <b class = "viewFacility">View Facilities.Clinic</b>
    <h2 class = "viewFacility">Klinik Dr Aman</h2>
  </div>

  <div class = "container">
    <div><img src = "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR6-mFphRmIezueHA7V429dmmZL1X6GT6G764mW2T4OXx1nEf2S" style = "width:39.8vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTpLRGbZ4D-YSmP42HGI6XlzILo8UOkELx7N6wGqcHF5KHUhZtu" style = "width:20vw; object-fit: cover;"></div>
    <div><img src = "https://lh5.googleusercontent.com/p/AF1QipOoqEzfttACI_vDmbzRLP9Zxz7lUQzBuyj-mpW-=w360-h240-n-k-no" style = "width:39.8vw; object-fit: cover;"></div>
  </div>
</sec>
<br><br>
<sec>
  <div class="color-bar">
    <b class = "viewFacility">View Facilities.Halls</b>
    <h2 class = "viewFacility">Grand Petra</h2>
  </div>

  <div class = "container">
    <div><img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShhyZkiKqQT70OWZgBjCmAelCtJ1z_fH6gNAPKeHiNZsoqyb_G" style = "width:27.8vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQdrcmR-koV7LCewCKOzkPS_Xa745IskRIoxG8NNagcDcZIbDQE" style = "width:71.8vw; object-fit: cover;"></div>
  </div>
</sec>

<br><br>
<sec>
  <div class="color-bar">
    <b class = "viewFacility">View Facilities.The Stage</b>
    <h2 class = "viewFacility">The Stage</h2>
  </div>

  <div class = "container">
    <div><img src = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQXmSzvdmx9k6qfI2xgOZHFGcENxOyGTcg4AHP7BTtqJrRaILeK" style = "width:29.8vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcRKg9G1FOftxd4U1wqSnp8c1ZGDEU6Vmqkn1F2e02KxiFVqGgAJ" style = "width:40vw; object-fit: cover;"></div>
    <div><img src = "https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTdDh83CD-3r6Q2hfcYgseiRFosDQ0hbsoidk331RN_RHOkHy6j" style = "width:29.8vw; object-fit: cover;" ></div>
  </div>
</sec>
</body>
</html>