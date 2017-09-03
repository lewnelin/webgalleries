
<div class="container">
    <h3>Book your Stand</h3>
    <?php foreach ($galleries as $gallery) : ?>
        <div style="width: 100px; height: 100px; border: 1pt solid; float: left" >
        <?= $gallery->dsName ?>
        </div>
    <?php endforeach; ?>
</div>