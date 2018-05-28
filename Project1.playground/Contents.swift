import PlaygroundSupport

// make a single collection named "PLAYERS" with all info for players

var players = [
"Joe Smith": ["42", "yes", "Jim and Jan Smith"],
"Jill Tanner": ["36", "yes", "Clara Tanner"],
"Herschel Krustofski": ["45", "yes", "Hyman and Rachel Krustofski"],
"Les Clay": ["42", "yes", "Wynonna Brown"],
"Phillip Helm": ["44", "yes", "Thomas Helm and Eva Jones"],
"Arnold Willis": ["43", "no", "Claire Willis"],
"Chloe Alaska": ["47", "no", "David and Jamie Alaska"],
"Diego Soto": ["47", "yes", "Robin and Sarika Soto"],
"Ben Finkelstein": ["44", "no", "Aaron and Jill Finkelstein"],
"Joe Kavalier": ["39", "no", "Sam and Elaine Kavalier"],
"Sal Dali": ["41", "no", "Gala Dali"],
"Suzane Greenberg": ["44", "yes", "Henrietta Dumas"],
"Karl Saygan": ["42", "yes", "Heather Bledsoe"],
"Sammy Adams": ["45", "no", "Jeff Adams"],
"Bill Bon": ["43", "yes", "Sara and Jenny Bon"],
"Eva Gordon": ["45", "no", "Wendy and Mike Gordon"],
"Matt Gill": ["40", "no", "Charles and Sylvia Gill"],
"Kimmy Stein": ["41", "no", "Bill and Hillary Stein"]
]



// players stored in collection names teamSharks - teamDragons - teamRaptors

var teamSharks = [String: String]()
var teamDragons = [String: String]()
var teamRaptors = [String: String]()

// Dictionary to separate the experienced players
var expPlayers = [String: String]()

// Array for parent letters
var letters = [String]()

// keep a count of the players on the teams
var havePlayedBefore = 0

var experiencedRaptorsPlayers = 0
var noExperienceRaptorsPlayers = 0

var experiencedSharksPlayers = 0
var noExperienceSharksPlayers = 0

var experiencedDragonsPlayers = 0
var noExperienceDragonsPlayers = 0

var experiencedDividedPlayers = 0
var noExperienceDividedPlayers = 0




// loop to separate the experienced player into their own dict and remove them from player dict

for (key, value) in players {
    let experiencedPlayer = value[1]
    let parentName = value[2]
    if experiencedPlayer == "yes" {
        expPlayers.updateValue(experiencedPlayer, forKey: key)
        expPlayers.updateValue(parentName, forKey: key)
        players.removeValue(forKey: key)
        havePlayedBefore += 1
        experiencedDividedPlayers = expPlayers.count / 3
        noExperienceDividedPlayers = players.count / 3
    }
}

// Adding experienced players to the Raptors
for (key, value) in expPlayers {
    if experiencedRaptorsPlayers < experiencedDividedPlayers {
        teamRaptors.updateValue(value, forKey: key)
        expPlayers.removeValue(forKey: key)
        experiencedRaptorsPlayers += 1
    }
 }
// Adding kids that never played before to the Raptors
for (key, value) in players {
    let parentName = value[2]
    if noExperienceRaptorsPlayers < noExperienceDividedPlayers {
        teamRaptors.updateValue(parentName, forKey: key)
        players.removeValue(forKey: key)
        noExperienceRaptorsPlayers += 1
    }
}

// Adding experienced players to the Sharks
for (key, value) in expPlayers {
    if experiencedSharksPlayers < experiencedDividedPlayers {
        teamSharks.updateValue(value, forKey: key)
        expPlayers.removeValue(forKey: key)
        experiencedSharksPlayers += 1
    }
    
}

// Adding kids that never played before to the Sharks
for (key, value) in players {
    let parentName = value[2]
    if noExperienceSharksPlayers < noExperienceDividedPlayers {
        teamSharks.updateValue(parentName, forKey: key)
        players.removeValue(forKey: key)
        noExperienceSharksPlayers += 1
    }
}

// Adding experienced players to the Dragons
for (key, value) in expPlayers {
    if experiencedDragonsPlayers < experiencedDividedPlayers {
        teamDragons.updateValue(value, forKey: key)
        expPlayers.removeValue(forKey: key)
        experiencedDragonsPlayers += 1
    }
}

// Adding kids that never played before to the Dragons
for (key, value) in players {
    let parentName = value[2]
    if noExperienceDragonsPlayers < noExperienceDividedPlayers {
        teamDragons.updateValue(parentName, forKey: key)
        players.removeValue(forKey: key)
        noExperienceDragonsPlayers += 1
    }
}


// #5 letters

//Team Dragons parent letters

for (key, value) in teamDragons {
    switch key {
    default:
        letters.append("Hi \(value) you child \(key) is now a member of the Dragons soccer team. The first practice will be March 17, 1pm.")
    }
}

//Team Sharks parent letters
for (key, value) in teamSharks {
    switch key {
    default:
        letters.append("Hi \(value) you child \(key) is now a member of the Sharks soccer team. The first practice will be March 17, 3pm.")
    }
}

//Team Raptors parent letters
for (key, value) in teamRaptors {
    switch key {
    default:
        letters.append("Hi \(value) you child \(key) is now a member of the Raptors soccer team. The first practice will be March 18, 1pm.")
    }
}

