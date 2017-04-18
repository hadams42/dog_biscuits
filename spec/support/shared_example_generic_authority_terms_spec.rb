# frozen_string_literal: true

shared_examples_for 'generic_authority_terms' do
  # the class that includes the concern
  let(:stubby) { FactoryGirl.build(described_class.to_s.split('::')[1].underscore.to_sym) }

  it 'has approved' do
    expect(stubby.approved).to eq('true')
  end
  it 'has used' do
    expect(stubby.used).to eq('true')
  end
  it 'has rules' do
    expect(stubby.rules).to eq('nca')
  end
  it 'has approved predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#approved')))
  end
  it 'has used predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#used')))
  end
  it 'has rules predicate' do
    expect(stubby.resource.dump(:ttl).should(include('http://dlib.york.ac.uk/ontologies/generic#rules')))
  end
end
