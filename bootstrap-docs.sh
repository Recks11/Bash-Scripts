#!/bin/bash
#A Script to run Bootstrap documentation server because man can't be arsed
echo ""
echo "!!!Bootstrap-docs!!!"
echo ""
echo "A Script to run Bootstrap documentation server because man can't be arsed"
echo ""

location=~/Snapshots/docs/Bootstrap

download() {
    rm -rf ~/Snapshots/docs/Bootstrap
    git clone https://github.com/twbs/bootstrap.git $location;
    go_to_location;
    rm -rf .git;
    give_space;
    echo "Do you want to setup bootstrap now? [y/N]";

    read -r -p "${1: do you want to setup now? [y/n]}" response;
    if [[ $response == 'y' ]]; then
      setup;
    else
      exit
    fi
}
setup() {
  echo "Setting up Bootstrap docs";
  go_to_location;
  give_space;

  echo "running bundle install";
  give_space;
  bundle install;

  echo "npm run install";
  npm install;

  echo "npm run test"
  npm run test;

  give_space;
  echo "finished setting up docs"
  give_space;

  echo "do you want to run now?"
  read -r -p "${1: do you want to run now? [y/n]}" response;
  if [[ $response == 'y' ]]; then
    run_docs
  else
    exit
  fi
}

go_to_location()
{
echo "navigating to $location"
cd $location;
}

run_docs()
{
  go_to_location;
  echo "running npm run docs-serve"
  npm run docs-serve;
}

give_space(){
  echo "";
}

close(){
  echo 'closing'
  exit;
}

if [[ $1 == '-download' ]]; then
  download;
fi

if [[ $1 == '-setup' ]]; then
    setup;
fi

if [[ $1 == '-run' ]]; then
	run_docs;
fi

if [[ $1 == '' ]]; then
  echo " use -download to download and install dependencies"
	echo " use -setup to install dependencies"
	echo " use -run to run server"
fi

close;
