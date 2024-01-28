pub contract nbaDrafting{


  pub let allPlayers :[Player];

  init () {
    self.allPlayers = [];
    }

  pub struct Player {
    pub var name: String;
    pub var age: UInt;
    pub var college: String;


    init(name: String, age: UInt, college: String) {
      self.name = name;
      self.age = age;
      self.college = college;
    }
  }


    pub fun addPlayer (name: String, age: UInt, college: String) {
      let newPlayer = Player(name: name, age: age, college: college);
   
      self.allPlayers.append(newPlayer);
    }

}
