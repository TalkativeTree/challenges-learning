var squareView = $("div").addClass("square");

function Field(sideLength){
  this.squares =
}
function Square(kind, game){
  this.game = game;
  this.kind = new EmptySquare();
  this.gameResult = "none";
  this.view = squareView;
}

Square.prototype= {
  arm: function(){
    this.kind = new Mine();
    this.gameResult = "lose";
    this.view.addClass("bomb");
  },
  flag: function(){
    this.view.addClass("flagged");
  },
  setWarning: function(numOfNeighborMines){
    this.kind = new Warning(numOfNeighborMines);
    this.gameResult = "win";
    this.view.addClass("warning");
  },
  showResult: function(){
    alert(this.gameResult);
  },
  reveal: function(){
    this.showResult();
    if(this.gameResult === "lose"){
      this.game.lose();
    }else if(this.gameResult === "win"){
      this.game.win();
    }else{
      this.game.nextRound();
    }
  }
};

function EmptySquare(){
}
function Mine(){
}
function Warning(){
}

function MineSweeper(sideLength, mines){
  this.init(sideLength, mines);
}

MineSweeper.prototype = {
  //setting up game mechanics
  setUpField: function(sideLength){
    this.fieldWidth = sideLength;
    var numberOfSides = sideLength * sideLength;
        squares = [];

    for(var i = 0; i < numberOfSides; i ++){
      squares.push(new Square("empty", this));
    }
    this.field = squares;
  },
  placeMines: function(number){
    var mines = _.sample(this.field, number);
    _.each(mines, this.armSqaure);
    this.mines = mines;
  },
  armSqaure: function(square){
    square.arm();
  },
  //playiny game mechanics
  sweep: function(square){
    this.field[square].reveal();
  },
  flag: function(square){
    this.field[square].flag();
  },
  //round/victory mechanics
  win: function(){
    alert("you won!");
  },
  lose: function(){
    alert("you lose!");
  },
  nextRound: function(){
    alert("make your next move!");
  },
  restart: function(){
    this.init();
  },
  init: function(sideLength, mines){
    sideLength = sideLength || 8;
    mines = mines || 10;
    this.setUpField(sideLength);
    this.placeMines(mines);
  }
};

function FieldView(field){
  this.height = 50 * (field.length / field.length);
  this.width = this.height;
  this.template = $('div').addClass('field');
}

function MineSweeperView(game){
  this.game = game;
  this.field = fieldView;
  this.squares = game.field.map(function(square){ return new SquareView(); });
}

GameRenderer.prototype = {
  renderField: function(){
    $('body').append(this.fieldView);
  },
  renderSquare: function(square){
    $('body').append(square.view);
  },
  renderSquares: function(){
    _.each(this.game.field, this.renderSquare);
  },
  init: function(){
    this.renderField();
    this.renderSquares();
  }
};

function GameController(boardSize, numberOfMines) {
  var newGame = new MineSweeper(boardSize, numberOfMines);
  var renderer = new GameRenderer(newGame);
}

$(function(){
  var controller
});