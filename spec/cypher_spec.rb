
require 'spec_helper'
require_relative "../lib/cypher"

RSpec.describe Cypher do
    describe 'encode' do
      it 'returns an empty string when given empty string' do
        cypher = Cypher.new
        result = cypher.encode("", 2)
        expect(result).to eq("")
      end

      it 'returns an simple string modified by deviation when given simple string and number' do
        cypher = Cypher.new
        result = cypher.encode("a", 1)
        expect(result).to eq("b")
      end

      it 'returns a complex string modified by deviation when given complex string and number' do
        cypher = Cypher.new
        result = cypher.encode("abcdefg", 1)
        expect(result).to eq("bcdefgh")
      end

      it 'handles large numbers' do
        cypher = Cypher.new
        
        result = cypher.encode("b", 257)

        expect(result).to eq("c")
      end

      it 'handles really large numbers' do
        cypher = Cypher.new
        result = cypher.encode("a", 25601)
        expect(result).to eq("b")
      end

      it 'handles multiples of 256 and still be encoded' do
        cypher = Cypher.new
        result = cypher.encode("a", 256)
        expect(result).to eq("b")
      end
      
    end

    describe 'decode' do
        it 'returns an empty string when given empty string' do
          cypher = Cypher.new
          result = cypher.decode("", 2)
          expect(result).to eq("")
        end
  
        it 'returns an simple string modified by deviation when given simple string and number' do
          cypher = Cypher.new
          result = cypher.decode("b", 1)
          expect(result).to eq("a")
        end
  
        it 'returns a complex string modified by deviation when given complex string and number' do
          cypher = Cypher.new
          result = cypher.decode("bcdefgh", 1)
          expect(result).to eq("abcdefg")
        end
  
        it 'handles large numbers' do
          cypher = Cypher.new
          
          result = cypher.decode("c", 257)
  
          expect(result).to eq("b")
        end
  
        it 'handles really large numbers' do
          cypher = Cypher.new
          result = cypher.decode("b", 25601)
          expect(result).to eq("a")
        end
  
        it 'handles multiples of 256 and still be decoded' do
          cypher = Cypher.new
          result = cypher.decode("b", 256)
          expect(result).to eq("a")
        end
        
      end
    
  
end
