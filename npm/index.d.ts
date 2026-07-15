declare module '@apiverve/chartgenerator' {
  export interface chartgeneratorOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface chartgeneratorResponse {
    status: string;
    error: string | null;
    data: ChartGeneratorData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface ChartGeneratorData {
      id:          null | string;
      format:      null | string;
      expires:     number | null;
      type:        null | string;
      downloadURL: null | string;
  }

  export default class chartgeneratorWrapper {
    constructor(options: chartgeneratorOptions);

    execute(callback: (error: any, data: chartgeneratorResponse | null) => void): Promise<chartgeneratorResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: chartgeneratorResponse | null) => void): Promise<chartgeneratorResponse>;
    execute(query?: Record<string, any>): Promise<chartgeneratorResponse>;
  }
}
