<section class="overflow-hidden container mx-auto">
    <div class="section-head px-6 md:px-0 max-w-3xl mx-auto">
        <h2 class="text-center mb-6 font-medium">Nos derniers tutos</h2>
    </div>
    <div class="flex flex-col md:flex-row gap-8">
        {foreach from=$feeds item=feed}
        <div class="w-full md:w-1/3 lbg-bg-light">
            <a target="_blank" href="{$feed['link']}" class="w-full">
                <img class="w-full h-72 object-cover" src="{$feed['urlimage']}" alt="{$feed['title']}">
            </a>
            <div class="lbg-bg-light lbg-text-dark px-3 pt-3 pb-6 text-center">
                <h5 class="my-3 font-medium">{$feed['title']}</h5>
                <a target="_blank" href="{$feed['link']}" class="underline font-bold">Je découvre ›</a>
            </div>
        </div>
        {/foreach}
    </div>
</section>