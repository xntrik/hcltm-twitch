threatmodel "Vending Machine" {
  description  = "We want to protect the goodies inside the vending machine"
  imports      = null
  link         = ""
  diagram_link = ""
  author       = "xntrik"
  created_at   = 1636704903
  updated_at   = 1636704903

  attributes {
    new_initiative  = true
    internet_facing = true
    initiative_size = "Undefined"
  }
  

  usecase {
    description = "Users who put money in the machine want a goodie"
  }

  data_flow_diagram {
    trust_zone "Inside vending machine" {
      process "User pays vending machine" {}
      data_store "money reserves" {}
      data_store "The goodies themselves" {}
      data_store "Goodie cost database" {}
      process "Vending machine delivers goods" {}
      process "Validate payment" {}
    }
    external_element "Hungry customer" {}
    external_element "Staff" {}
    process "Vending machine is topped up" {}
    process "Money is removed" {}

    flow "money" {
      from = "Hungry customer"
      to = "User pays vending machine"
    }

    flow "money" {
      from = "User pays vending machine"
      to = "money reserves"
    }

    flow "goodies" {
      from = "Vending machine delivers goods"
      to = "Hungry customer"
    }

    flow "goodies" {
      from = "The goodies themselves"
      to = "Vending machine delivers goods"
    }

    flow "money amount" {
      from = "User pays vending machine"
      to = "Validate payment"
    }

    flow "success" {
      from = "Validate payment"
      to = "User pays vending machine"
    }

    flow "goodies details" {
      from = "User pays vending machine"
      to = "Vending machine delivers goods"
    }

    flow "goodies details" {
      from = "Validate payment"
      to = "Goodie cost database"
    }


  }
}

spec_version = "0.1.0"
