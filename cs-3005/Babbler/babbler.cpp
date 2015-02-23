#include <map>
#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
#include <utility>
#include <cstdlib>
#include <ctime>

std::map<std::string, std::pair<int, std::map<std::string, int> > > data;
int total = 0;

void read_file(const std::string &filename)
{
  std::ifstream fin(filename.c_str());
  if(!fin)
    {
      std::cerr << "Could not open " << filename << std::endl;
      return;
    }
  std::string keyword;
  std::string prevword;
  fin >> keyword;
  while(fin)
    {
      prevword = keyword;
      fin >> keyword;
      if(fin)
        {
	  total++;
          try {
	    data[prevword].first++;
	  }
	  catch (...){
	    data[prevword].first = 1;
	  }

	  try {
	    data[prevword].second[keyword]++;
	  }
	  catch (...){
	    data[prevword].second[keyword] = 1;
	  }
        }
    }
  fin.close();
}

std::string getNewWord(){
  int the_chosen_word = rand() % total;
  int subtotal = 0;
  std::map<std::string, std::pair<int, std::map<std::string, int> > >::iterator iter;
  for(iter = data.begin(); iter != data.end(); iter++){
    //std::cout << "In get new word: " << iter->first << std::endl;
    subtotal += data[iter->first].first;
    if (the_chosen_word < subtotal){
      return iter->first;
    }
  }
}

std::string getNewSubWord(std::string wurd){
  int the_chosen_word = rand() % data[wurd].first;
  int subtotal = 0;
  std::map<std::string, int>::iterator iter;
  for(iter = data[wurd].second.begin(); iter != data[wurd].second.end(); iter++){
    //std::cout << "In get new sub word: " << iter->first << std::endl;
    subtotal += data[wurd].second[iter->first];
    if (the_chosen_word < subtotal){
      return iter->first;
    }
  }
}

void write_file(const std::string &filename)
{
  std::ofstream fout(filename.c_str());
  if(!fout)
    {
      std::cerr << "Unable to open " << filename << std::endl;
      return;
    }

  /* one item per line */
  unsigned int i;
  
  std::string word;
  std::string prevword;
  word = getNewWord();
  for(i = 0; i < total; i++)
    {
      prevword = word;
      fout << prevword << " ";
      if (data[prevword].second.empty()){
	word = getNewWord();
      }
      else {
	word = getNewSubWord(prevword);
      }
    }
  
  fout.close();
}

int main(){
  srand(time(0));
  read_file("input.txt");
  write_file("output.txt");
  return 0;
}
