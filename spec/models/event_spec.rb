RSpec.describe Event, type: :model do
  it { should have_valid(:name).when("Watertown Market") }
  it { should have_valid(:description).when("I am an event description.", nil) }
  it { should have_valid(:start_time).when("2017-12-20 09:10:33") }
  it { should have_valid(:end_time).when("2017-09-20 09:10:33") }
  it { should have_valid(:event_url).when("http://www.google.com/maps") }
  it { should have_valid(:address).when("221B Baker St") }
  it { should have_valid(:state).when("MA", "CT") }
  it { should have_valid(:city).when("Boston", "Providence") }
  it { should have_valid(:map_url).when("http://www.google.com/maps") }


  it { should_not have_valid(:name).when("", nil) }
  it { should_not have_valid(:start_time).when("", nil, "123-45-342 0912:23:1") }
  it { should_not have_valid(:end_time).when("", nil, "123-45-342 0912:23:1") }
  it { should_not have_valid(:event_url).when("www.fj.com", "fj.com") }
  it { should_not have_valid(:address).when("", nil) }
  it { should_not have_valid(:state).when("", nil) }
  it { should_not have_valid(:city).when("", nil) }
  it { should_not have_valid(:map_url).when("www.fj.com", "fj.com") }

end
