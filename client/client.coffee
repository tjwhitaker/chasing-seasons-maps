Template.map.rendered = ->
    
    map = 0
    heatmap = 0
    surfCoordinates = []
    snowCoordinates = []
    rockCooridnates = []
    trailCoordinates = []

    for spot in surf_spots then do (spot) ->
        surfCoordinates.push({location: new google.maps.LatLng(spot['latitude'],spot['longitude']), weight: 1})

    initialize = ->
        styles = [
            {
                featureType: "road",
                elementType: "geometry",
                stylers: [
                    {lightness: 100},
                    {visibility: "simplified"}
                ]
            },
            {
                featureType: "poi",
                elementType: "labels",
                stylers: [
                    {visibility: "off"}
                ]
            }
            {
                featureType: "road",
                elementType: "labels",
                stylers: [
                    {visibility: "off"}
                ]
            }
        ]

        mapOptions = {
            zoom: 6
            center: new google.maps.LatLng(37.774546,-122.433523)
            mapTypeId: google.maps.MapTypeId.ROADMAP
            panControl: false
            mapTypeControl: false
            streetViewControl: false
            styles: styles
        }

        map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions)

        pointArray = new google.maps.MVCArray(snowCoordinates)

        heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray})
        heatmap.setOptions({radius:25})

        heatmap.setMap(map)

    toggleSurf = ->
        heatmap.setMap(null)
        pointArray = new google.maps.MVCArray(surfCoordinates)
        heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray})
        heatmap.setOptions({radius:25})
        heatmap.setMap(map)

    toggleSnow = ->
        heatmap.setMap(null)
        pointArray = new google.maps.MVCArray(snowCoordinates)
        heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray})
        heatmap.setOptions({radius:25})
        heatmap.setMap(map)


    toggleRock = ->
        heatmap.setMap(null)
        pointArray = new google.maps.MVCArray(rockCoordinates)
        heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray})
        heatmap.setOptions({radius:25})
        heatmap.setMap(map)


    toggleTrail = ->
        heatmap.setMap(null)
        pointArray = new google.maps.MVCArray(trailCoordinates)
        heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray})
        heatmap.setOptions({radius:25})
        heatmap.setMap(map)


    $('.surf').click ->
        toggleSurf()

    $('.snow').click ->
        toggleSnow()

    $('.rock').click ->
        toggleRock()

    $('.trail').click ->
        toggleTrail()

    initialize()
