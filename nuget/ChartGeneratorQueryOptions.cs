using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.ChartGenerator
{
    /// <summary>
    /// Query options for the Chart Generator API
    /// </summary>
    public class ChartGeneratorQueryOptions
    {
        /// <summary>
        /// Chart type
        /// </summary>
        [JsonProperty("type")]
        public string Type { get; set; }

        /// <summary>
        /// Array of labels for the x-axis or chart segments
        /// </summary>
        [JsonProperty("labels")]
        public List<string> Labels { get; set; }

        /// <summary>
        /// Array of datasets with 'name' and 'values'
        /// </summary>
        [JsonProperty("datasets")]
        public List<string> Datasets { get; set; }

        /// <summary>
        /// Optional title displayed on the chart
        /// </summary>
        [JsonProperty("title")]
        public string Title { get; set; }

        /// <summary>
        /// Image width in pixels
        /// </summary>
        [JsonProperty("width")]
        public int? Width { get; set; }

        /// <summary>
        /// Image height in pixels
        /// </summary>
        [JsonProperty("height")]
        public int? Height { get; set; }

        /// <summary>
        /// Output format
        /// </summary>
        [JsonProperty("format")]
        public string Format { get; set; }
    }
}
