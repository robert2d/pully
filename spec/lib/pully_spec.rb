describe Pully do
  subject { described_class }

  before do
    allow_any_instance_of(Git::Lib).to receive(:command).and_return('master')
    allow(RbConfig::CONFIG).to receive(:[]).and_return(os)
  end

  context 'https URL' do
    describe '#open' do
      let(:os) { 'darwin' }

      it 'opens the url on OSX' do
        expect_any_instance_of(subject).to receive(:system).with(
          'open https://github.com/robert2d/pully/compare/master?expand=1'
        )
        expect_any_instance_of(Git::Base).to receive(:config).and_return(
          'remote.origin.url' => 'git@github.com:robert2d/pully.git'
        )
        subject.open
      end

      it 'opens company url' do
        expect_any_instance_of(subject).to receive(:system).with(
          'open https://github.com/NuffieProductions/CE-Service/compare/master?expand=1'
        )
        expect_any_instance_of(Git::Base).to receive(:config).and_return(
          'remote.origin.url' => 'git@github.com:NuffieProductions/CE-Service.git'
        )
        subject.open
      end
    end
  end

  context 'git URL' do
    describe '#open' do
      let(:os) { 'darwin' }

      it 'opens the url on OSX' do
        expect_any_instance_of(subject).to receive(:system).with(
          'open https://github.com/robert2d/pully/compare/master?expand=1'
        )
        expect_any_instance_of(Git::Base).to receive(:config).and_return(
          'remote.origin.url' => 'https://github.com/robert2d/pully.git'
        )
        subject.open
      end
    end
  end

  describe 'other OS' do
    before do
      allow_any_instance_of(Git::Base).to receive(:config).and_return(
        'remote.origin.url' => 'https://github.com/robert2d/pully.git'
      )
    end

    context 'windows' do
      let(:os) { 'mswin' }

      it 'opens correctly' do
        expect_any_instance_of(subject).to receive(:system).with(
          'start https://github.com/robert2d/pully/compare/master?expand=1'
        )
        subject.open
      end
    end

    context 'linux' do
      let(:os) { 'bsd' }

      it 'opens correctly' do
        expect_any_instance_of(subject).to receive(:system).with(
          'xdg-open https://github.com/robert2d/pully/compare/master?expand=1'
        )
        subject.open
      end
    end
  end
end
