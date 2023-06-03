# frozen_string_literal: true

require 'rails_helper'

describe CycleDateHelper do
  describe '#from_now_or_ago_in_words' do
    subject(:method) { from_now_or_ago_in_words(date) }

    context 'whith a date date several days in the future' do
      let(:date) { 3.days.from_now.beginning_of_day }

      it { is_expected.to eq('dans 3 jours') }
    end

    context 'whith a date date the next day' do
      let(:date) { 1.day.from_now.beginning_of_day }

      it { is_expected.to eq('demain') }
    end

    context 'whith a date date the same day in' do
      let(:date) { 3.hours.from_now.beginning_of_day }

      it { is_expected.to eq("aujourd'hui") }
    end

    context 'whith a date date the the previous day' do
      let(:date) { 1.day.ago.beginning_of_day }

      it { is_expected.to eq('hier') }
    end

    context 'whith a date date several days ago' do
      let(:date) { 3.days.ago.beginning_of_day }

      it { is_expected.to eq('il y a 3 jours') }
    end
  end

  describe '#since_when' do
    subject(:method) { since_when(date) }

    context 'with a date the same day' do
      let(:date) { 1.hour.ago.beginning_of_day }

      it { is_expected.to eq("depuis aujourd'hui") }
    end

    context 'with a date the previous day' do
      let(:date) { 1.day.ago.beginning_of_day }

      it { is_expected.to eq('depuis hier') }
    end

    context 'whith a date date several days ago' do
      let(:date) { 3.days.ago.beginning_of_day }

      it { is_expected.to eq('depuis 3 jours') }
    end
  end
end
