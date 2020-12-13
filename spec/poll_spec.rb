require_relative '../lib/poll'

RSpec.describe Poll do
  it 'has a title and candidates' do
    poll = Poll.new('Awesome Poll', ['Alice','Bob'])

    expect(poll.title).to eq 'Awesome Poll'
    expect(poll.candidates).to eq ['Alice', 'Bob']
  end

  describe '#add_vote' do
    it 'saves the given vote' do
      poll = Poll.new('Awesome Poll',['Alice','Bob'])
      vote = Vote.new('Miyoshi', 'Alice')

      poll.add_vote(vote)

      expect(poll.votes).to eq [vote]
    end

    context 'with a vote that has an invalid candidate' do
      it 'raises InvalidCandidateError' do
        poll = Poll.new('Awesome Poll',['Alice','Bob'])
        vote = Vote.new('Miyoshi','INVALID')

        expect { poll.add_vote(vote) }.to raise_error Poll::InvalidCandidateError
        # ただ単純にpoll.voteにinvalid入れたら、アラート出るようにしてるだけ！
      end
    end
  end

end