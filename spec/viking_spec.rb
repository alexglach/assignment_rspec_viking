require 'weapons/bow'
require 'weapons/weapon'
require 'viking'

describe Bow do

  let(:bow) { Bow.new }
  describe '#arrows' do

    it 'arrow count is a fixnum' do
      expect(bow.arrows).to be_a(Fixnum)
    end

    it 'arrow count starts at 10 by default' do
      expect(bow.arrows).to eq(10)
    end

    it 'starts with a specified num of arrows' do
      expect(Bow.new(4).arrows).to eq(4)
    end
  end

  describe '#use' do

    it 'reduces arrow count by one' do
      bow.use
      expect(bow.arrows).to eq(9)
    end

    it 'throws an error if there are no arrows left' do
      10.times { bow.use }
      expect{bow.use}.to raise_error("Out of arrows")
    end
  end
end

describe Viking do

  let(:viking) { Viking.new("Sven", 99) }
  let(:weapon) { Weapon.new('Mjolnir') }
  let(:enemy_viking) { Viking.new("Oleg")}

  describe '#initialize' do

    it 'passing a name sets the name attribute' do
      expect(viking.name).to eq("Sven")
    end

    it 'passing a health attribute sets the health' do
      expect(viking.health).to eq(99)
    end
  end

  describe '#health' do
    it 'cannot be overwritten once it has been initialized' do
      expect{viking.health = 50}.to raise_error(NoMethodError)
    end
  end

  describe '#weapon' do
    it 'starts out as nil' do
      expect(viking.weapon).to eq(nil)
    end

  end

  describe '#pick_up_weapon' do

    it 'picking up a weapon replaces the vikings existing weapon' do
      viking.pick_up_weapon(weapon)
      expect(viking.weapon).to eq(weapon)
    end

    it 'cannot pick up a non weapon' do
      weapon = "not a weapon"
      expect{viking.pick_up_weapon(weapon)}.to raise_error("Can't pick up that thing")
    end

    it "replaces the viking's current weapon" do
      viking.pick_up_weapon(weapon)
      badassweapon = viking.pick_up_weapon(Weapon.new("badassweapon"))
      expect(viking.weapon).to eq(badassweapon)
    end
  end

  describe '#drop_weapon' do

    it "drops the viking's current weapon" do
      viking.pick_up_weapon(weapon)
      viking.drop_weapon
      expect(viking.weapon).to eq(nil)
    end
  end

  describe '#receive_attack' do

    it "reduces Viking's health by the specified amount" do
      viking.receive_attack(10)
      expect(viking.health).to eq(89)
    end 

    it "has a receive_attack method which calls the take_damage method" do
      expect(viking).to receive('take_damage').with(10)
      viking.receive_attack(10)
    end

  end

  describe '#attack' do


    it "causes the recipient's health to drop" do
      viking.attack(enemy_viking)
      expect(enemy_viking.health).to eq(97.5)
    end

    it "calls the enemy viking's take_damage method" do
      expect(enemy_viking).to receive('take_damage').with(2.5)
      viking.attack(enemy_viking)
    end

    it "runs damage_with_fists if Viking has no weapon" do
      expect(viking).to receive('damage_with_fists').and_return(2.5)
      viking.attack(enemy_viking)
    end

  end






















end
