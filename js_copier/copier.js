function Bulletin(){
  this.node = $('.bulletin');
  this.view = new BulletinView();
  this.copier = new Copier(self);
  this.init();
}

Bulletin.prototype.init = function(){
  this.view.render();
};

Bulletin.prototype.addListener = function() {
  this.on('click', function(e){
    this.addCopy(e.pageX, e.pageY);
  });
};

Bulletin.prototype.addCopy = function(first_argument) {
  this.view.append(this.copier.copiedView.attr)
};

function BulletinView(){
  this.node = $('body');
}
BulletinView.prototype.render = function() {
  this.node.addClass('bulletin');

};
BulletinView.prototype.add = function(copy) {
  this.node.append(copy);
};

function Copier(receiver){
  this.watched_nodes = [new Notes()];
  this.receiver = receiver;
  this.init();
}

Copier.prototype.subscribe = function() {
  var copier = this;
  this.watched_nodes.forEach(function(node){
    node.on('click', copier.receiver.addCopy(node));
  });
};

Copier



new Bulletin();
