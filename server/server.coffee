Meteor.publish("spots", -> Spots.find())

Meteor.startup ->

    Meteor.methods
