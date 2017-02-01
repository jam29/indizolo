<tags>
	<div class="form-group">
		<label class="control-label" for="inputTitle">Tags { this.type } </label> 
		<input type="text" class="form-control" name="tag"  onkeyup={ addTag } ></input>
	</div>
	<div>
		<span each={leTag, index in this.afficheTag } class="label label-danger"> { leTag.tag } </span>
	</div>

<style>
.label {
	margin-right:5px;
   	margin-bottom:5px;
}

</style>

<script>

this.mixin(SharedMixin);

this.type="musique";
this.afficheTag = [];

var that=this;

this.addTag = function (e){
	e.preventDefault(); 
	if (  e.key == ',' ) { 
		var tag = e.target.value.slice(0,e.target.value.length-1);
		if (tag.length > 0 ) {that.afficheTag.push({tag:tag});}
		riot.update() ;
		
		this.observable.trigger('tagAdded',{tags:that.afficheTag});
		e.target.value = "" ;
	}
} 

</script>
</tags>